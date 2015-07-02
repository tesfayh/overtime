# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
sdayOfOt = document.getElementById 'startingday'
dayofweek =  sdayofot.value.getDate()
if dayofweek == 6
  document.getElementById('startingtime').value = 1
