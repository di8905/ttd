$(document).ready(function(){
  $("a.edit_number").click(function(e){
    e.preventDefault();
    var train_id;
    var form;
    
    train_id = $(this).data("trainId");
    console.log(train_id);
    form = $("#edit_train_" + train_id);
    title = $("#train_number_" + train_id);
    
    if (!$(this).hasClass("cancel")) {
      $(this).html('Отменить');
      $(this).addClass('cancel btn-warning');
    } else {
      $(this).html('Редактировать номер');
      $(this).removeClass('cancel btn-warning');
    }
    form.toggle();
    title.toggle();
  });
});
