#!/usr/bin/env nextflow

params.nomusic = false
params.nosound = false

process printLogo {
    output:
    stdout

    script:
    '''
    echo """
▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
▒▒████████████████████▒▒██████████████████▒▒██████████████████▒▒██████▒▒▒▒▒▒████████▒▒
▒▒▒▒██████████████████▒▒██████████████████▒▒██████████████████▒▒██████▒▒▒▒▒▒██████▒▒▒▒
  ▒▒██████████████████▒▒██████████████████▒▒██████████████████▒▒████████▒▒████████▒▒
  ▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████████████████▒▒
  ▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████████████████▒▒
  ▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████████████████▒▒
  ▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████████████████▒▒
  ▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████████████████▒▒
  ▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████████████████▒▒
  ▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████████████████▒▒
  ▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████████████████▒▒
  ▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████████████████▒▒
  ▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒▒▒▒▒██████▒▒██████▒▒██▒▒██████▒▒
  ▒▒██████▒▒▒▒████████▒▒████████▒▒▒▒██████▒▒██████▒▒▒▒████████▒▒██████▒▒▒▒▒▒██████▒▒
  ▒▒██████▒▒████████▒▒▒▒▒▒████████████████▒▒████████████████▒▒▒▒▒▒████▒▒  ▒▒██████▒▒
  ▒▒██████████████▒▒▒▒  ▒▒▒▒████████████▒▒▒▒▒▒████████████▒▒▒▒  ▒▒████▒▒  ▒▒██████▒▒
  ▒▒████████████▒▒▒▒      ▒▒▒▒████████▒▒▒▒  ▒▒▒▒████████▒▒▒▒    ▒▒▒▒██▒▒  ▒▒██████▒▒
  ▒▒██████████▒▒▒▒          ▒▒▒▒████▒▒▒▒      ▒▒▒▒████▒▒▒▒        ▒▒▒▒▒▒  ▒▒██████▒▒
  ▒▒████████▒▒▒▒              ▒▒▒▒▒▒▒▒          ▒▒▒▒▒▒▒▒                  ▒▒▒▒████▒▒
  ▒▒██████▒▒▒▒                                                              ▒▒████▒▒
  ▒▒████▒▒▒▒                                                                ▒▒▒▒██▒▒
  ▒▒██▒▒▒▒                                                                    ▒▒██▒▒
  ▒▒▒▒▒▒                                                                      ▒▒▒▒▒▒
"""'''
}

process printQuote {
    input:
    val doomLogo

    output:
    val true

    exec:
    def quotes = [
        "Get ready to rip and tear!",
        "They are rage, brutal, without mercy. But you... you will be worse.",
        "No rest for the living.",
        "Knee-deep in the dead.",
        "The demons are everywhere. Time to fight back.",
        "Hell on Earth awaits.",
        "Loading up for battle...",
        "Remember: shoot first, ask questions later.",
        "Warning: May contain demons."
    ]
    def randomQuote = quotes[new Random().nextInt(quotes.size())]
    def logoWidth = 86
    def quoteWidth = randomQuote.length() + 3
    def border = "═" * quoteWidth
    def leftPadding = " " * ((logoWidth - quoteWidth) / 2).intValue()
    print(doomLogo)
    println "${leftPadding}${border}\n${leftPadding}  ${randomQuote}\n${leftPadding}${border}"
    Thread.sleep(1000)  // Pause for dramatic effect
}

process playDoom {
    input:
    val logoDone

    output:
    val true

    script:
    def soundFlags = params.nosound ? '-nosound' : (params.nomusic ? '-nomusic' : '')
    """
    java -jar $projectDir/lib/mochadoom.jar -iwad $projectDir/doom1.wad $soundFlags
    """
}

process insultUser {
    input:
    val done

    exec:
    def quotes = [
        "That's it? I've seen better performance from a failed process.",
        "All done? That execution was about as clean as your error logs.",
        "Finished already? Even a corrupted FASTQ file is less of a mess than that.",
        "Had enough? Your gameplay needs serious debugging. Maybe try with -resume.",
        "Done so soon? I've seen conda environments resolve faster than your reflexes.",
        "Quitting already? Error: Player performance below minimum quality threshold.",
        "Too much for ya? Maybe stick to the easier levels next time.",
        "Giving up? Even the zombies put up more of a fight than you did.",
        "That's all? Maybe turn the difficulty down... oh wait, you already did.",
        "Game over? The demons weren't scared. They were laughing.",
        "Already done? Did you even try, or were you just sightseeing?",
        "Finished? That was painful to watch. The demons send their regards.",
        "Had enough? Next time, try using the weapons instead of running into walls."
    ]
    def randomQuote = quotes[new Random().nextInt(quotes.size())]
    def logoWidth = 86
    def quoteWidth = randomQuote.length() + 3
    def border = "~" * quoteWidth
    def leftPadding = " " * ((logoWidth - quoteWidth) / 2).intValue()
    println "\n${leftPadding}${border}\n${leftPadding}  ${randomQuote}\n${leftPadding}${border}"
    Thread.sleep(1000)  // Pause for dramatic effect
}

workflow {
    printLogo | printQuote | playDoom | insultUser
}
