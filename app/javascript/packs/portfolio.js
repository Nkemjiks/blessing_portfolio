import Sortable from 'sortablejs';

window.onload = function() {
  var el = document.getElementById('sortable');
  if (el) {
    Sortable.create(sortable, {
      animation: 150,
      easing: "cubic-bezier(1, 0, 0, 1)",
      onUpdate: function (evt) {
        var cards = document.getElementsByClassName('card-wrapper');
        var updated_order = [];
        for (var i = 0; i < cards.length; i++) {
          updated_order.push({
            id: cards[i].dataset.id,
            position: i + 1
          })
        }
        const data = { order: updated_order }
        fetch('/portfolios/sort', {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(data),
        })
      },
    });
  }
}