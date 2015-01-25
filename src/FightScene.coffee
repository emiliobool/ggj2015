class FightScene
  constructor: (@game) ->
    @sprite_bg = @game.add.sprite 0, 0, 'fightbg'
    @dragon  = @game.add.sprite 80, 0, 'fightboss'
    @hero  = @game.add.sprite 400, 70, 'player'
    @hero2  = @game.add.sprite 430, 110, 'player'
    @hero3  = @game.add.sprite 460, 150, 'player'
