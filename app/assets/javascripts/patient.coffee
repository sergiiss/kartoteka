# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  nextVisitDate = (target) ->
    visitDate = $('#patient_visit_date').val();
    D = new Date(visitDate);
    D.setMonth(D.getMonth() + Number(target.val()));
    $('#patient_next_visit_date').val(D)

  setNextDate = ->
    visitDate = $('#patient_visit_date').val();
    D = new Date(visitDate);
    nextVisit = $('#patient_next_visit_date').val()
    N = new Date(nextVisit)
    yearInterval = (N.getFullYear() - D.getFullYear()) * 12
    currentInterval = N.getMonth() - D.getMonth()
    $('#interval').val(yearInterval + currentInterval)

  $(document).on 'turbolinks:load', ->
    setNextDate()

  setNextDate()

  $(document).on 'change', '#interval', ->
    nextVisitDate($(this))

  $(document).on 'change', '#patient_visit_date', ->
    nextVisitDate($('#interval'))

  setTimeout (->
    $('.alert').fadeOut()
  ), 4000

  $('.diagnosis').tooltip({
    placement: 'bottom'
  })

  $(document).on 'turbolinks:load', ->
    $('.diagnosis').tooltip({
      placement: 'bottom'
    })
