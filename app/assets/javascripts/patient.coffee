# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  nextVisitDate = (target) ->
    visitDate = $('#patient_visit_date').val();
    D = new Date(visitDate);
    D.setMonth(D.getMonth() + Number(target.val()));
    $('#patient_next_visit_date').val(D)

  $(document).on 'page:load', ->
    if $('#interval').length
      nextVisitDate($('#interval'))

  $(document).on 'change', '#interval', ->
    nextVisitDate($(this))

  $(document).on 'change', '#patient_visit_date', ->
    nextVisitDate($('#interval'))

  $('.diagnosis').tooltip({
    placement: 'bottom'
  })

  $(document).on 'click', '.delete-patient', ->
    confirm "Are you sure want to delete?"

