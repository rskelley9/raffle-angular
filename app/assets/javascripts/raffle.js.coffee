# $scope object is used to interfact with view
# Add @ to RaffleCtrl to make it accessible in controller
angular.module('Raffler', []).controller "RaffleCtrl", ($scope) ->
	$scope.entries = [
		{name:"Ryan"}
		{name:"Peyton"}
		{name:"Laura"}
		{name:"Penny"}
	]

	$scope.addEntry = ->
  	# Append entry to end of enties array
  	$scope.entries.push($scope.newEntry)
  	# Set to empty object
  	$scope.newEntry = {}