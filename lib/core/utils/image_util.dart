enum CdnImageSize {
  thumb240,
  thumb520,
  standard1024x768,
  hd1920x1080,
  fullWidth1920,
  fullHeight1080,
}

extension CdnImageSizeExt on CdnImageSize {
  String get value {
    switch (this) {
      case CdnImageSize.thumb240:
        return '240x240';
      case CdnImageSize.thumb520:
        return '520x520';
      case CdnImageSize.standard1024x768:
        return '1024x768';
      case CdnImageSize.hd1920x1080:
        return '1920x1080';
      case CdnImageSize.fullWidth1920:
        return '1920x';
      case CdnImageSize.fullHeight1080:
        return 'x1080';
    }
  }
}

class ImageUtil {
  static String buildUrl(String baseUrl, CdnImageSize size) {
    return baseUrl.replaceFirst('{size}', size.value);
  }
}

