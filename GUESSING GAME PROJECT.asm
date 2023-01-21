INCLUDE EMU8086.INC
.MODEL SMALL
.STACK 100H
.DATA


.CODE

MAIN PROC
    
   PRINTN "" 
   PRINTN "        ------------ GUESSING GAME --------------- "
    
   PRINTN "||||    YOU HAVE TO GUESS A NUMBER FROM 0 - 9       ||||"
   PRINTN "||||    YOU WILL HAVE 3 CHANCE TO GUESS THE NUMBER  ||||"
      
   MOV AH, 0H       
   INT 1AH           

   PUSH DX
   POP AX
   XOR  DX, DX
   MOV  BX, 10    
   DIV  BX      

   ADD  DL, '0'  
   MOV BL,DL
     
   MOV BP,2
   MOV BH,3
   
   AGAIN:
   CMP BH,0
   JE END2
   
   PRINTN ""
   PRINT "NOW GUESS: "
   MOV AH,1
   INT 21H
   
   CMP AL,BL
   JE CONGO 
   JL LOW
   JG HIGH
   JMP END
   
   
   CONGO:
   PRINTN " " 
   PRINTN " "
   PRINTN "CONGRATULATIONS !!!"
   PRINTN "YOU HAVE  GUESSED IT CORRECTLY..."
   MOV AH,2
   MOV DX,BX
   INT 21H
   PRINTN " IS THE NUMBER..."  
   JMP END
   
   LOW:
   PRINTN " "
   PRINTN "YOUR GUESS IS LOW..."
   PRINT "YOU HAVE "
   MOV AH,2
   MOV DX,BP
   ADD DX,48
   INT 21H
   PRINTN " CHANCES REMAINING... "
   DEC BH
   DEC BP
   LOOP AGAIN

   
   HIGH:
   PRINTN ""
   PRINTN "YOUR GUESS IS HIGH..."
   PRINT "YOU HAVE "
   MOV AH,2
   MOV DX,BP
   ADD DX,48
   INT 21H
   PRINTN " CHANCES REMAINING... "
   DEC BP 
   DEC BH
   LOOP AGAIN
   
   
   END2:
   PRINTN "GAME OVER..."
   MOV AH,2
   MOV DX,BX
   INT 21H
   PRINTN " WAS THE NUMBER..."   
   
   
   END:
        MOV AH,4CH
        INT 21H
        
   
ENDP PROC
END MAIN