class FightScene
  constructor: (@game) ->
    @sprite_bg = @game.add.sprite 0, 0, 'fightbg'
    @dragon  = @game.add.sprite 0, 0, 'fightboss'
