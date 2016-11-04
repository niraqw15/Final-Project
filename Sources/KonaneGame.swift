class KonaneGame {

    private let gameState = KonaneGameState()

	private let blackInputSource: KonaneMoveInputSource
	private let whiteInputSource: KonaneMoveInputSource
    private let rowLine: String

    init(blackIsHuman: Bool, whiteIsHuman: Bool) {
        //Stuff goes here.
        if blackIsHuman {
            blackInputSource = KonaneMoveInputSourceHuman(isBlack: true)
        } else {
            fatalError("AI doesn't work yet")
        }
        if whiteIsHuman {
            whiteInputSource = KonaneMoveInputSourceHuman(isBlack: false)
        } else {
            fatalError("AI doesn't work yet")
        }

        //Creates the horizontal line for printing the board.
        var rowLine: String = "+"
        for _ in 0..<gameState.width {
            rowLine += "---+"
        }
        self.rowLine = rowLine
    }


	func play() -> Bool { /* Returns true if black wins. Technically contains main code for running game moves. */ 

        displayBoard()
        let blackRemove = blackInputSource.removeFirstPiece(gameState: gameState)
        gameState.perform(blackRemove: blackRemove)
        displayBoard()
        let whiteRemove = whiteInputSource.removeSecondPiece(gameState: gameState)
        gameState.perform(whiteRemove: whiteRemove)
        //Do code for a turn.
        
        return true //Change when done writing.

    }

	//Displays the game board.
    private func displayBoard() {
        //Makes and prints each row of the board

    	for yVal in (0..<gameState.height).reversed() {
    		var currentRowSquares: String = "|"
    		for xVal in 0..<gameState.width {
    			//Turns the enum value into something the computer can print.
    			if gameState.boardDataStorage[yVal][xVal] == KonaneColor.black {
    				currentRowSquares += " X |"
    			} else if gameState.boardDataStorage[yVal][xVal] == KonaneColor.white {
    				currentRowSquares += " O |"
    			} else {
    				currentRowSquares += "   |"
    			}
    		}
    		print(rowLine)
    		print(currentRowSquares)
    	}
    	print(rowLine)
        print() //Makes a blank line in preparation for the next printed thing.
   	}

    

}