# $scope object is used to interfact with view
# Add @ to RaffleCtrl to make it accessible in controller
angular.module('Raffler', []).controller "RaffleCtrl", ($scope) ->
	$scope.entries = [
		{name:"Ryan"}
		{name:"Peyton"}
		{name:"Laura"}
		{name:"Penny"}
	]

  # call when the form is submitted/ENTER is pressed
	$scope.addEntry = ->
  	# Append entry to end of enties array
  	$scope.entries.push($scope.newEntry)
  	# Set to empty object
  	$scope.newEntry = {}

  $scope.drawWinner = ->
  	# select a random item by slicing array randomly
  	entry = $scope.entries[Math.floor(Math.random()*$scope.entries.length)]
  	# set entry object winner attribute to true to show span.winner when ng-show evals to true
  	entry.winner = true