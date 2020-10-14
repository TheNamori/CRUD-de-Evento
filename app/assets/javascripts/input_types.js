$(document).on('turbolinks:load', function() {
  $("[type=numeric]").keypress(function(event) {
    if (!event.charCode) return true;          
    ch = String.fromCharCode(event.charCode);
    return (/[\d]/.test(ch));
  });
  $("[type=text]").keypress(function(event) {
    if (!event.charCode) return true;          
    ch = String.fromCharCode(event.charCode);
    return (/[A-Za-z0-9 _]/.test(ch));
  });
  $("[type=name]").keypress(function(event) {
    if (!event.charCode) return true;          
    ch = String.fromCharCode(event.charCode);
    return (/[A-Za-z _]/.test(ch));
  });
})