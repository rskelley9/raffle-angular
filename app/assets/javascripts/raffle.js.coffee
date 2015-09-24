# Create RaffleCtrl controller function by calling it on app 'Raffler' angular module
# name is specified in html ng-app="Raffler" attribute in layout
angular.module('Raffler', []).controller "RaffleCtrl", ($scope) ->
  # Note: $scope object is used to interface with view like 'this' in jQuery
  $scope.entries = [
    {name:"Ryan"}
    {name:"Laura"}
    {name:"Peyton"}
    {name:"Penny"}
    {name:"Casey"}
    {name:"Hershey"}
    {name:"Angelica"}
    {name:"Bobby"}
    {name:"Peanut"}
    {name:"Bruce"}
    {name:"Finley"}
    {name:"Wee"}
  ]

  # call when the form is submitted/ENTER is pressed
  $scope.addEntry = ->
    # Append entry to end of entries array
    $scope.entries.push($scope.newEntry)
    # Set to empty object
    $scope.newEntry = {}

  $scope.drawWinner = ->

    # create a pool to limit selection to those that haven't already won
    pool = []

    # only add entry object to pool if entry is not a winner
    angular.forEach $scope.entries, (entry) ->
      pool.push(entry) if !entry.winner

    # when pool has entries in it, select a random entry from pool to be winner
    # via random slice
    if pool.length > 0
      entry = pool[Math.floor(Math.random()*pool.length)]
      # set entry object winner attribute to true
      # so WINNER message is shown when ng-show entry.winner evals to true
      entry.winner = true
      # set the last winner to the winning entry object
      # so span.winner highlights when ng-class is truthy
      $scope.lastWinner = entry

  # call on Clear Raffle button click event
  $scope.clearWinners = ->
    $scope.lastWinner = null
    angular.forEach $scope.entries, (entry) ->
      entry.winner = false