class addFields {
  constructor() {
    this.links = document.querySelectorAll('.add_fields');
    this.iterateLinks();
  };

  iterateLinks() {
    if (this.links.length === 0) return;
    this.links.forEach(link => {
      link.addEventListener('click', e => {
        this.handleClick(link, e);
      });
    });
  };

  handleClick(link, e) {
    if (!link || !e ) return;
    e.preventDefault();

    
    if(this.addFieldsLimiter){
      let time = new Date().getTime();
      let linkId = link.dataset.id;
      let regexp = linkId ? new RegExp(linkId, 'g') : null;
      let newFields = regexp ? link.dataset.fields.replace(regexp, time) : null;
      newFields ? link.insertAdjacentHTML('beforebegin', newFields) : null;
    } else {
      alert('Não é possível adicionar mais telefones!')
    }

    this.phoneInputMask();
  }

  get addFieldsLimiter(){
    const maxGuestPhones = 5;
    let numberOfCurrentGuestPhones = document.querySelectorAll('.nested-fields').length;
    return maxGuestPhones > numberOfCurrentGuestPhones;
  }

  phoneInputMask(){
    $(".phone").mask('(99) 9999-99999', { maxlength: 15 });
  }
}
window.addEventListener('turbolinks:load', () => new addFields());