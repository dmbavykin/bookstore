$(document).on("turbolinks:load", () => {
  jQuery.fn.toggleAttr = function(attr) {
   return this.each(() => {
    let $this = $(this);
    $this.attr(attr) ? $this.removeAttr(attr) : $this.attr(attr, attr);
   });
  };
})
