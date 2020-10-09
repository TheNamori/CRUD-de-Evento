
class addFields {
  constructor() {
    this.links = document.querySelectorAll('.add_fields')
    this.iterateLinks()
  }

  iterateLinks() {
    if (this.links.length === 0) return
    this.links.forEach(link => {
      link.addEventListener('click', e => {
        this.handleClick(link, e)
      })
    })
  }

  handleClick(link, e) {
    if (!link || !e ) return
    e.preventDefault()

    let fieldDelimiter = document.querySelectorAll('.nested-fields').length
    if(fieldDelimiter < 5){
      let time = new Date().getTime()
      let linkId = link.dataset.id
      let regexp = linkId ? new RegExp(linkId, 'g') : null
      let newFields = regexp ? link.dataset.fields.replace(regexp, time) : null
      newFields ? link.insertAdjacentHTML('beforebegin', newFields) : null
    }
    $(".phone").mask('(99) 9999-99999', { maxlength: 15 })
    $(".cep").mask("99999-999", { maxlength: 9 });
  }
}
window.addEventListener('turbolinks:load', () => new addFields())