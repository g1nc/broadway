# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.review-rating').raty
		readOnly: true
		score: ->
			return $(this).attr('data-score')
		path: '/assets/'

	$('#rating-form').raty
		path: '/assets/'
		scoreName: 'review[rating]'

	$('.average-review-rating').raty
		readOnly: true
		score: ->
			return $(this).attr('data-score')
		path: '/assets/'