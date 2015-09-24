## This is a practice application and the comments are used as a guide while I followed RailsCast 405
## -----------------------------------------------------------------------------

# Create RaffleCtrl controller function by calling it on app 'Raffler' angular module
# name is specified in html ng-app="Raffler" attribute in layout
## define ngResource as a dependency for module to take advantage of angular-resource
## allows us to use $resource to communicate over REST API.
app = angular.module('Raffler', ["ngResource"]).controller "RaffleCtrl", ($scope, $resource) ->
  # second arg specifies default paremeters, the current object's id to append to /entries/ url
  Entry = $resource("/entries/:id", {id: "@id"}, {update: {method: "PUT"}})
  # Note: $scope object is used to interface with view like 'this' in jQuery

  ## retrieves entries array from database via json api
  $scope.entries = Entry.query()

  ## or you can hard code in an array of entry objects
  # $scope.entries = [
  #   {name:"Ryan"}
  #   {name:"Laura"}
  #   {name:"Peyton"}
  #   {name:"Penny"}
  #   {name:"Casey"}
  #   {name:"Hershey"}
  #   {name:"Angelica"}
  #   {name:"Bobby"}
  #   {name:"Peanut"}
  #   {name:"Bruce"}
  #   {name:"Finley"}
  #   {name:"Wee"}
  # ]

  # initialize a counter to track raffle draws
  $scope.drawCount = 0

  # call when the form is submitted/ENTER is pressed
  $scope.addEntry = ->
    # Save a new entry to the database
    entry = Entry.save($scope.newEntry)
    # Append entry to end of entries array if using hard-coded approach
    $scope.entries.push(entry)
    $scope.newEntry = {}


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

      # Update entry in database
      Entry.update(entry)

      # set the last winner to the winning entry object
      # so span.winner highlights when ng-class is truthy
      $scope.lastWinner = entry
      $scope.drawCount++

  # call on Clear Raffle button click event
  # TODO: UPDATE DATABASE ACCORDINGLY
  $scope.clearRaffle = ->
    $scope.lastWinner = null
    angular.forEach $scope.entries, (entry) ->
      entry.winner = false
    $scope.drawCount = 0
