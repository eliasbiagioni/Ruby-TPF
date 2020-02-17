function showOrHideContent(){
    if($("#content").hasClass('d-none')){
        $("#content").removeClass('d-none')
        $("#showHideButton").text("Ocultar contenido")
    }else{
        $("#content").addClass('d-none')
        $("#showHideButton").text("Ver contenido")
    }
}

function addContentToCatalog(recordId, catalogId){
    recordType = $("#recordType option:selected").val()
    if(confirm('¿Desea agregar este contenido al catalogo?')){
        Rails.ajax({
          url: "/catalogs/"+catalogId+'/add_content',
          type: "PUT",
          data: "recordType="+recordType+"&recordId="+recordId,
          success: function(data) {
            alert('El contenido ha sido agregado correctamente.')
            location.reload()
          },
          error: function(data) {}
        })
    }
}

function removeContentFromCatalog(recordId, catalogId, recordType){
    if(confirm('¿Desea eliminar este contenido del catalogo?')){
        Rails.ajax({
          	url: "/catalogs/"+catalogId+'/content',
          	type: "DELETE",
          	data: "recordType="+recordType+"&recordId="+recordId,
          	success: function(data) {
            	alert('El contenido ha sido eliminado correctamente.')
            	location.reload()
          	},
        	error: function(data) {}
      	})
    }
}