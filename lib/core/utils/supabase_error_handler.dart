import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

String supabaseErrorHandler({
  AuthException? authError,
  StorageException? storageError,
  PostgrestException? postgrestError,
}) {
  var message = '';
  var statusCode = 0;

  if (authError != null) {
    statusCode = int.parse(authError.statusCode ?? '0');
    if (kDebugMode) {
      print('==> [E_AUTH] $statusCode: ${authError.message}');
    }
  } else if (storageError != null) {
    statusCode = int.parse(storageError.statusCode ?? '0');
    if (kDebugMode) {
      print('==> [E_STORAGE] ${storageError.message}');
    }
  } else if (postgrestError != null) {
    statusCode = int.parse(postgrestError.code ?? '0');
    if (kDebugMode) {
      print('==> [E_POSTGREST] ${postgrestError.message}');
    }
  }

  switch (statusCode) {
    // Auth Errors
    case 400:
      if (authError?.message == 'Email not confirmed') {
        message = "Votre email n'est pas confirmé, consulter votre boite mail";
      } else {
        switch (storageError?.message ?? postgrestError?.message ?? '') {
          case 'InvalidRequest':
            message = 'Requête invalide. Veuillez vérifier les paramètres.';
          case 'InvalidBucketName':
            message = 'Le nom du compartiment spécifié est invalide.';
          case 'InvalidKey':
            message = 'La clé spécifiée est invalide.';
          case 'InvalidMimeType':
            message = "Le type MIME spécifié n'est pas valide.";
          case 'InvalidUploadId':
            message = "L'ID de téléchargement spécifié est invalide.";
          case 'MissingParameter':
            message = 'Un paramètre requis est manquant dans la requête.';
          case 'S3MaximumCredentialsLimit':
            message =
                "Le nombre maximum d'informations d'identification a été atteint.";
          default:
            message = 'Email ou mot de passe incorrect. Veuillez réessayer.';
        }
      }

    case 401:
      message = (authError?.message == 'InvalidJWT')
          ? 'Le JWT (JSON Web Token) fourni est invalide. Veuillez vous reconnecter.'
          : 'Authentification invalide. Veuillez vous reconnecter.';

    case 403:
      switch (storageError?.message ?? '') {
        case 'InvalidSignature':
        case 'SignatureDoesNotMatch':
          message =
              'La signature fournie ne correspond pas à la signature calculée.';
        case 'AccessDenied':
          message = "L'accès à la ressource spécifiée est refusé.";
        case 'InvalidUploadSignature':
          message = 'La signature de téléchargement fournie est invalide.';
        case 'S3InvalidAccessKeyId':
          message = "L'ID de clé d'accès AWS fourni est invalide.";
        default:
          message = 'Accès refusé. Vérifiez vos autorisations.';
      }

    case 404:
      switch (storageError?.message ?? postgrestError?.message ?? '') {
        case 'NoSuchBucket':
          message = "Le compartiment spécifié n'existe pas.";
        case 'NoSuchKey':
          message = "La clé spécifiée n'existe pas.";
        case 'NoSuchUpload':
          message = "Le téléchargement spécifié n'existe pas.";
        case 'TenantNotFound':
          message = "Le locataire spécifié n'existe pas.";
        default:
          message =
              "Ressource non trouvée. Vérifiez l'existence de la ressource demandée.";
      }

    case 409:
      switch (storageError?.message ?? '') {
        case 'KeyAlreadyExists':
          message = 'La clé existe déjà.';
        case 'BucketAlreadyExists':
          message = 'Le compartiment existe déjà.';
        case 'ResourceAlreadyExists':
          message = 'La ressource spécifiée existe déjà.';
        default:
          message = 'Conflit. La ressource existe déjà ou est en conflit.';
      }

    case 411:
      message = "L'en-tête Content-Length est manquant.";

    case 413:
      message = "L'entité téléchargée est trop volumineuse.";

    case 416:
      message = "La plage spécifiée n'est pas valide.";

    case 423:
      switch (storageError?.message ?? postgrestError?.message ?? '') {
        case 'ResourceLocked':
          message = 'La ressource spécifiée est verrouillée.';
        case 'LockTimeout':
          message = "Délai d'attente dépassé lors de l'attente d'un verrou.";
        default:
          message = 'Ressource verrouillée. Veuillez réessayer plus tard.';
      }
    case 429:
      message = 'Trop de requêtes. Veuillez réessayer plus tard.';

    case 500:
      message = 'Erreur interne du serveur. Veuillez réessayer plus tard.';

    case 503:
      message =
          'La fréquence des requêtes est trop élevée et a été limitée. Veuillez ralentir.';

    case 504:
      message =
          "Délai d'attente de la base de données dépassé. Veuillez réessayer plus tard.";

    default:
      if (storageError?.message == 'S3Error') {
        message = "Une erreur s'est produite en relation avec Amazon S3.";
      } else {
        message = 'Une erreur inattendue est survenue. Veuillez réessayer.';
      }
  }
  return message;
}
