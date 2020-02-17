function showOrHide(){
    if($("#songs").hasClass('d-none')){
        $("#songs").removeClass('d-none')
        $("#showHideButton").text("Ocultar canciones")
    }else{
        $("#songs").addClass('d-none')
        $("#showHideButton").text("Ver canciones")
    }
}