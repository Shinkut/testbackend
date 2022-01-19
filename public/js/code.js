const modalPet = new bootstrap.Modal(document.getElementById('modalPet'))

const on = (element, event, selector, handler) => {
    element.addEventListener(event, e => {
        if(e.target.closest(selector)){
            handler(e)
        }
    })
}

on(document, 'click', '.btnEditar', e =>{
    const fila = e.target.parentNode.parentNode
    id_updt.value = fila.children[0].innerHTML
    name_updt.value = fila.children[1].innerHTML
    cityId_updt.value = fila.children[2].innerHTML
    lastname_updt.value = fila.children[3].innerHTML
    email_updt.value = fila.children[4].innerHTML
    cellphone_updt.value = fila.children[5].innerHTML
    modalPet.show()
})