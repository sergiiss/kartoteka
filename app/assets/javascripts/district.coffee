$ ->
  $(document).on 'click', '.link-scope', ->
    $(@).find('a')[0].click()