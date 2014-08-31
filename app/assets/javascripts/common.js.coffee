$ ->
  window.createFlash = (message, type = 'info') ->
    flash = "<div class='alert alert-#{type} alert-dismissible'>
               <button class='close' data-dismiss='alert'>&times;</button>
               #{message}
             </div>"
    $('#flash').html flash
