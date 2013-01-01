# alert "Game loaded!"
# console.log "No more alerts!"
# console.error "In case something goes wrong."

name = "Steak Styles"
score = 8675308
display = "Player #{name} has #{score++} points"
console.log "#{display}"

# i like coffeescript
danger = "HIGH" if score < 10
power = on unless score is 0
console.log "GO!" for [1..3]
console.log "...and a #{ x }" for x in [1..4]
console.log x for x in [1..10]

topPlayers = ["Max", "Lily", "Brian", "Tracy"]
for player, i in topPlayers
  console.log "Rank: #{ i }. Player: #{ player }"


