.MODEL SMALL
.STACK 100H
.DATA
    ; DEFINE YOUR VARIABLES
    M1 DB "WELCOME TO ABC BANK $"
    M2 DB "PLS CHOOSE YOUR ROLE: $"
    M3 DB "1.USER $"
    M4 DB "2.BANK EMPLOYEE $"
    M5 DB "**************CUSTOMER*************$"
    M6 DB "**************BANK EMPLOYEE*************$"
    M7 DB "PLEASE ENTER YOUR ID:$"
    M8 DB "PLEASE ENTER YOUR PASSWORD:$"
    M9 DB "WE FOUND YOUR ACCOUNT$"
    M10 DB "INCORRECT INFORMATION$"
    M11 DB "ENTER USER ID TO KNOW THEIR BANK BALANCE $"
    M12 DB "1. WITHDRAW      2. CHECK BALANCE $"
    M13 DB "3. EXIT $"
    M14 DB "INSUFFICIENT AMOUNT$"
    M15 DB "CURRENT BALANCE IS --> $"
    M16 DB "ENTER YOUR AMOUNT $"
    M17 DB "DO YOU WANT TO CONTINUE ?  1.YES   2.NO $"
    UID DB 1,2,3,4,5
    UPASS DB 1,2,3,4,5
    EID DB 6,7,8,9,0
    EPASS DB 6,7,8,9,0 
    BALANCE DB 2,4,6,8,0
   
.CODE  
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        ; YOUR CODE STARTS HERE        
        
        MAIN_FUNC:
        MOV DL,0DH
        MOV AH,2
        INT 21H
            
        MOV DL,0AH
        MOV AH,2
        INT 21H        
 
        LEA DX , M1   ;Welcome to ABC bank
        MOV AH , 9
        INT 21H
        
        MOV DL,0DH
        MOV AH,2
        INT 21H
        
        MOV DL,0AH
        MOV AH,2
        INT 21H
        
        LEA DX , M2  ;PLS CHOOSE YOUR ROLE:
        MOV AH , 9
        INT 21H
        
        MOV DL,0DH
        MOV AH,2
        INT 21H
        
        MOV DL,0AH
        MOV AH,2
        INT 21H
        
        LEA DX , M3  ;1.USER
        MOV AH , 9
        INT 21H
        
        
        MOV DL,0DH
        MOV AH,2
        INT 21H
        
        MOV DL,0AH
        MOV AH,2
        INT 21H
        
        LEA DX , M4  ;2.BANK EMPLOYEE
        MOV AH , 9
        INT 21H
        
        ;CHOOSING THE ROLE
        
        MOV DL,0DH
        MOV AH,2
        INT 21H
        
        MOV DL,0AH
        MOV AH,2
        INT 21H        
        ;INPUT FOR ROLE
        MOV AH,1
        INT 21H
        SUB AL,30H
        ;MOV BH,AL
        
        ;OUTPUT
        ;ADD BH , 30H
        ;MOV DL, BH
        ;MOV AH,2
        ;INT 21H
        
        CMP AL , 1
        JE USER

        CMP AL , 2
        JE EMP        
                
        USER:     ;CUSTOMER
                MOV DL,0DH
                MOV AH,2
                INT 21H
                
                MOV DL,0AH
                MOV AH,2
                INT 21H
                                
                LEA DX , M5
                MOV AH , 9
                INT 21H
                
                MOV DL,0DH
                MOV AH,2
                INT 21H
                
                MOV DL,0AH
                MOV AH,2
                INT 21H        
                
                LEA DX , M7  ;ENTER YOUR ID
                MOV AH , 9
                INT 21H
                
                ;INPUT
                MOV AH,1
                INT 21H
                SUB AL,30H
                MOV BH,AL
                
                ;OUTPUT
                ;ADD BH , 30H
                ;MOV DL, BH
                ;MOV AH,2
                ;INT 21H
                
                MOV CX, 5
                MOV SI,0
                START1:              ; FINDING USER ID IN ARRAY
                 CMP BH , UID[SI]
                 JE FOUNDID
                 ADD SI,1
                LOOP START1
                JMP ERRORID
               FOUNDID:              ;AFTER FINDING THE ID             
                    MOV DL,0DH
                    MOV AH,2
                    INT 21H
                    
                    MOV DL,0AH
                    MOV AH,2
                    INT 21H
                                    
                    LEA DX , M8   ;ENTER YOUR PASSWORD
                    MOV AH , 9
                    INT 21H
            
                    MOV AH,1
                    INT 21H
                    SUB AL,30H
                    MOV CH,AL
                    
                    CMP CH , UPASS[SI]
                    JE ACCOUNT
                    JMP ERRORID           
        
                ;OUTPUT
                ;ADD CH , 30H
                ;MOV DL, CH
                ;MOV AH,2
                ;INT 21H                
                
                
               
               
           ;ACCOUNT UI    
               
               ACCOUNT:
                               
                    MOV DL,0DH
                    MOV AH,2
                    INT 21H
                    
                    MOV DL,0AH
                    MOV AH,2
                    INT 21H
                                           
                    LEA DX , M12  ; 1. WITHDRAW   2.CHECK BALANCE
                    MOV AH , 9
                    INT 21H
                    
                    MOV DL,0DH
                    MOV AH,2
                    INT 21H
                    
                    MOV DL,0AH
                    MOV AH,2
                    INT 21H
                    
                    LEA DX , M13   ;EXIT
                    MOV AH , 9
                    INT 21H
                    
                    MOV DL,0DH
                    MOV AH,2
                    INT 21H
                    
                    MOV DL,0AH
                    MOV AH,2
                    INT 21H
                   
                   
                   ;INPUT FROM UI 
                   MOV AH,1
                   INT 21H
                   SUB AL,30H
                   MOV BH,AL
                   
                   MOV DL,0DH
                   MOV AH,2
                   INT 21H
                    
                   MOV DL,0AH
                   MOV AH,2
                   INT 21H
                   
                   CMP BH , 1
                   JE WITHDRAW
                   
                   CMP BH , 2
                   JE BALANCEINFO_USER
                   
                   CMP BH , 3
                   JE MAIN_FUNC
                   
                   ;INCORRECT INPUT FROM UI        
                   JMP ACCOUNT
                   
                  WITHDRAW:
                        
                        
                       ;ENTERING AMOUNT TO WITHDRAW
                       LEA DX , M16
                       MOV AH , 9
                       INT 21H 
                       MOV AH,1
                       INT 21H
                       SUB AL,30H
                       MOV BH,AL
                       
                       CMP BALANCE[SI],BH
                       JL INSUFF
                       
                       ;UPDATING BALANCE
                       MOV CL , BALANCE[SI]
                       SUB CL , BH 
                       MOV BALANCE[SI] , CL
                       
                       
                       ;OUTPUT
                       MOV DL,0DH
                       MOV AH,2
                       INT 21H
                    
                       MOV DL,0AH
                       MOV AH,2
                       INT 21H
                        
                       LEA DX , M15
                       MOV AH , 9
                       INT 21H                       
                           
                       MOV DL , BALANCE[SI]
                       ADD DL, 30H
                       MOV AH,2
                       INT 21H
                       JMP ACTION_USER 
                       
                    BALANCEINFO_USER: ;TO KNOW BALANCE
                        MOV DL,0DH
                        MOV AH,2
                        INT 21H
                        
                        MOV DL,0AH
                        MOV AH,2
                        INT 21H
                        
                        LEA DX , M15
                        MOV AH , 9
                        INT 21H
                           
                        MOV DL, BALANCE[SI]
                        ADD DL, 30H
                        MOV AH,2
                        INT 21H
                        JMP ACTION_USER
                        
                                               
                  INSUFF:
                        MOV DL,0DH
                        MOV AH,2
                        INT 21H
                        
                        MOV DL,0AH
                        MOV AH,2
                        INT 21H
                        LEA DX , M14
                        MOV AH , 9
                        INT 21H
                        JMP ACTION_USER
 
        
        EMP:  ;BANK EMPLOYEE
        
            MOV DL,0DH
            MOV AH,2
            INT 21H
            
            MOV DL,0AH
            MOV AH,2
            INT 21H
                            
            LEA DX , M6
            MOV AH , 9
            INT 21H
            
            MOV DL,0DH
            MOV AH,2
            INT 21H
            
            MOV DL,0AH
            MOV AH,2
            INT 21H
                            
            LEA DX , M7  ;ENTER YOUR ID
            MOV AH , 9
            INT 21H
            
            MOV AH,1
            INT 21H
            SUB AL,30H
            MOV BH,AL
            MOV CX, 5
            MOV SI,0
            START2:              ; FINDING EMPLOYEE ID IN ARRAY
             CMP BH , EID[SI]
             JE FOUNDID2
             ADD SI,1
            LOOP START2
            JMP ERRORID        
           FOUNDID2:              ;AFTER FINDING THE ID             
                MOV DL,0DH
                MOV AH,2
                INT 21H
                
                MOV DL,0AH
                MOV AH,2
                INT 21H
                                
                LEA DX , M8   ;PASSWORD
                MOV AH , 9
                INT 21H
        
                MOV AH,1
                INT 21H
                SUB AL,30H
                MOV CH,AL
                
                CMP CH , EPASS[SI]
                JE FOUNDEMP
                JMP ERRORID
            
            FOUNDEMP:

                    MOV DL,0DH
                    MOV AH,2
                    INT 21H
                    
                    MOV DL,0AH
                    MOV AH,2
                    INT 21H
                     
                    LEA DX , M11    ;ENTER USER ID TO KNOW THEIR BANK BALANCE
                    MOV AH , 9
                    INT 21H
                    
                    
                      
                    MOV AH,1
                    INT 21H
                    SUB AL,30H
                    MOV BH,AL 
                   
 
                    MOV CX, 5
                    MOV SI,0
                    START3:              ; FINDING USER ID IN ARRAY
                    CMP BH , UID[SI]
                    JE BALANCEINFO_EMP
                    ADD SI,1
                    LOOP START3
                    JMP ERRORID
                    
                    BALANCEINFO_EMP:
                        MOV DL,0DH
                        MOV AH,2
                        INT 21H
                        
                        MOV DL,0AH
                        MOV AH,2
                        INT 21H
                        
                        LEA DX , M15
                        MOV AH , 9
                        INT 21H
                           
                        MOV DL, BALANCE[SI]
                        ADD DL, 30H
                        MOV AH,2
                        INT 21H
                        JMP ACTION_EMP                    
                    
                    
                    
                                 
        
 ERRORID:          ;ERROR HANDLING FOR ID
        MOV DL,0DH
        MOV AH,2
        INT 21H
        
        MOV DL,0AH
        MOV AH,2
        INT 21H
                        
        LEA DX , M10
        MOV AH , 9
        INT 21H
        JMP ACTION_ERROR

ACTION_ERROR:       ;DO YOU WANT TO CONTINUE AFTER ERROR
        MOV DL,0DH
        MOV AH,2
        INT 21H
        
        MOV DL,0AH
        MOV AH,2
        INT 21H
                        
        LEA DX , M17
        MOV AH , 9
        INT 21H
        
        MOV DL,0DH
        MOV AH,2
        INT 21H
        
        MOV DL,0AH
        MOV AH,2
        INT 21H
        
        MOV AH,1
        INT 21H
        SUB AL,30H
        MOV BH,AL
        
        
        CMP BH , 1
        JE MAIN_FUNC
        
        CMP BH , 2
        JE EXIT        
        
        
                               
ACTION_EMP:              ; DO YOU WANT TO CONTINUE FOR EMPLOYEE
        MOV DL,0DH
        MOV AH,2
        INT 21H
        
        MOV DL,0AH
        MOV AH,2
        INT 21H
                        
        LEA DX , M17
        MOV AH , 9
        INT 21H
        
        MOV DL,0DH
        MOV AH,2
        INT 21H
        
        MOV DL,0AH
        MOV AH,2
        INT 21H
        
        MOV AH,1
        INT 21H
        SUB AL,30H
        MOV BH,AL
        
        
        CMP BH , 1
        JE FOUNDEMP
        
        CMP BH , 2
        JE MAIN_FUNC
        
ACTION_USER:             ; DO YOU WANT TO CONTINUE FOR USER
        MOV DL,0DH
        MOV AH,2
        INT 21H
        
        MOV DL,0AH
        MOV AH,2
        INT 21H
                        
        LEA DX , M17
        MOV AH , 9
        INT 21H
        
        MOV DL,0DH
        MOV AH,2
        INT 21H
        
        MOV DL,0AH
        MOV AH,2
        INT 21H
        
        MOV AH,1
        INT 21H
        SUB AL,30H
        MOV BH,AL
        
        
        CMP BH , 1
        JE ACCOUNT
        
        CMP BH , 2
        JE MAIN_FUNC        
        
        
        ; YOUR CODE ENDS HERE
        EXIT:
        
         MOV AX, 4C00H
         INT 21H 
        
    MAIN ENDP
    END MAIN                   