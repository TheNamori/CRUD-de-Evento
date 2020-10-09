$(document).on("turbolinks:load", (function () {
  $(".phone").mask('(99) 9999-99999', { maxlength: 15 })
  $(".cep").mask("99999-999", { maxlength: 9 });
}))

//Em Javascript
// function mask(o, f) {
//   v_obj = o;
//   v_fun = f;
//   setTimeout("execMask()", 1);
// }
// function execMask() {
//   v_obj.value = v_fun(v_obj.value);
// }
// function numberRegex(v) {
//   v = v.replace(/\D/g, ""); //Remove tudo o que não é dígito
//   return v;
// }
// function DDDBrackets(v) {
//   v = v.replace(/^(\d\d)(\d)/g, "($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
//   return v;
// }
// function phoneHifen(v) {
//   //Coloca hífen entre o quarto e o quinto dígito
//   if (v.length < 14) v = v.replace(/(\d{4})(\d)/, "$1-$2");
//   //Coloca hífen entre o quinto e o sexto dígito
//   else if (v.length == 14) v = v.replace(/(\d{5})(\d)/, "$1-$2");
//   else phoneHifen(v);
//   return v;
// }
// function cepHifen(v) {
//   v = v.replace(/(\d{5})(\d)/, "$1-$2"); //Coloca hífen entre o quinto e o sexto dígito
//   return v;
// }
// function phone(v) {
//   v = numberRegex(v);
//   v = DDDBrackets(v);
//   v = phoneHifen(v);
//   return v;
// }
// function cep(v) {
//   v = numberRegex(v);
//   v = cepHifen(v);
//   return v;
// }
