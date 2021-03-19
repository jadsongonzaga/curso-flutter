
class Utils{
  static String removeCaracterEspecial(String valor){
    valor.replaceAll(RegExp('[}{,.^?~=+\-_\/*\-+.\|]'), '');
    return valor;
  }
}