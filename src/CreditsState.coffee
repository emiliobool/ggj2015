class CreditsState extends Phaser.State
  constructor: () ->
    @progress = 0
    @progress_events = []

  startMusic: ->
    @music.volume = 0.7
    @music.fadeIn(3000);

  create: ->
    creditsText = @game.cache.getText 'creditstext'
    @creditsSprite = @game.add.text 0, 0, creditsText, { font: '16px VT323', fill: '#FFFFFF'}
    @creditsSprite.y = @game.height
    @creditsSprite.x = 20

    @music = @game.add.audio 'credits_music'
    @music.onDecoded.add @startMusic, this

    @runAtProgress 0.0, () =>
      credits_image = @game.add.sprite 320, 30, 'credits0'
      credits_image.alpha = 0
      @game.add.tween(credits_image).to( { alpha:1 }, 3000, "Power0", false, 0).to( { alpha: 0 }, 3000, "Power0", false, 4000).start()
      
    @runAtProgress 0.125, () =>
      credits_image = @game.add.sprite 320, 30, 'credits1'
      credits_image.alpha = 0
      @game.add.tween(credits_image).to( { alpha:1 }, 3000, "Power0", false, 0).to( { alpha: 0 }, 3000, "Power0", false, 4000).start()

    @runAtProgress 0.25, () =>
      credits_image = @game.add.sprite 320, 30, 'credits2'
      credits_image.alpha = 0
      @game.add.tween(credits_image).to( { alpha:1 }, 3000, "Power0", false, 0).to( { alpha: 0 }, 3000, "Power0", false, 4000).start()

    @runAtProgress 0.375, () =>
      credits_image = @game.add.sprite 320, 30, 'credits3'
      credits_image.alpha = 0
      @game.add.tween(credits_image).to( { alpha:1 }, 3000, "Power0", false, 0).to( { alpha: 0 }, 3000, "Power0", false, 4000).start()

    @runAtProgress 0.5, () =>
      credits_image = @game.add.sprite 320, 30, 'credits4'
      credits_image.alpha = 0
      @game.add.tween(credits_image).to( { alpha:1 }, 3000, "Power0", false, 0).to( { alpha: 0 }, 3000, "Power0", false, 4000).start()

    @runAtProgress 0.625, () =>
      credits_image = @game.add.sprite 320, 30, 'credits5'
      credits_image.alpha = 0
      @game.add.tween(credits_image).to( { alpha:1 }, 3000, "Power0", false, 0).to( { alpha: 0 }, 3000, "Power0", false, 4000).start()

    @runAtProgress 0.75, () =>
      credits_image = @game.add.sprite 320, 30, 'credits0'
      credits_image.alpha = 0
      @game.add.tween(credits_image).to( { alpha:1 }, 3000, "Power0", false, 0).to( { alpha: 0 }, 3000, "Power0", false, 4000).start()

    @runAtProgress 0.875, () =>
      credits_image = @game.add.sprite 320, 30, 'credits7'
      credits_image.alpha = 0
      @game.add.tween(credits_image).to( { alpha:1 }, 3000, "Power0", false, 0).to( { alpha: 0 }, 3000, "Power0", false, 4000).start()

    @runAtProgress 1, () =>
      @game.state.start 'mapState'

  runAtProgress: (progress, callback) ->
    @progress_events.push [progress, true, callback]
  
  fireProgressEvents: ->
    for event in @progress_events
      if event[1] && event[0] <= @progress
        event[1] = false
        event[2]()

  update: ->
    @creditsSprite.y--
    @progress = 1 - (@creditsSprite.height + @creditsSprite.y) / @creditsSprite.height
    #console.log(@progress)
    @fireProgressEvents()

    