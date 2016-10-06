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
      $(this).addClass('cancel');
    } else {
      $(this).html('Редактировать номер');
      $(this).removeClass('cancel');
    }
    form.toggle();
    title.toggle();
  });
});
