class CreditsState extends Phaser.State
  constructor: () ->
    @progress = 0
  create: () ->
    credits = @game.cache.getText 'creditstext'

    @style =
      font: '16px VT323'
      fill: '#FFFFFF'
    @creditsSprite = @game.add.text 0, 0, credits, @style
    @creditsSprite.y = @game.height

    @pic1 = @game.add.sprite 320, 30, 'mypoorgrandma'
    @pic1.scale.x = 0.5
    @pic1.scale.y = 0.5
    @pic1.alpha = 0

    tween = @game.add.tween(@pic1).to( { alpha:1 }, 3000, "Power0", false, 3000).to( { alpha: 0 }, 3000, "Power0", false, 2500).repeatAll(1).loop().start()


  update: ->
    @creditsSprite.y--
    @progress = 1 - (@creditsSprite.height + @creditsSprite.y) / @creditsSprite.height
    if @progress > 1
      @game.state.start 'mapState'
    #console.log @progress