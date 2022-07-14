import datetime
import os
import time

diffDays: int
dir: str = ""
currentDateTime = datetime.datetime.now()
currentTime = time.time()
isSimulate: bool = True

def printTitle():
    os.system('cls')
    print(f'================================================================================')
    print(f'--- Delete old files v0.01.101 ---')

def setup():
    global dir
    global diffDays
    defaultDays: int = 30
    minDays: int = 0
    maxDays: int = 365
    print(f'================================================================================')
    print(f'--- Setup ---')
    dir = input(f"[i] Set directory: ")
    days = input(f"[i] Set days ago (default value: {defaultDays}): ")
    if (days != ""):
        if (int(days) > minDays and int(days) < maxDays):
            diffDays = int(days)
        else:
            diffDays = defaultDays
    else:
        diffDays = defaultDays
    global isSimulate
    simulate: str = input(f"[i] Set simlute (default value: True): ")
    if (simulate.upper().capitalize() == "False" or simulate.upper().capitalize() == "0"):
        isSimulate = False
    else:
        isSimulate = True

def printInfo():
    global dir
    global diffDays
    print(f'================================================================================')
    print(f'--- Info ---')
    print(f'[i] Directory: {dir}')
    print(f'[i] Days ago: {diffDays}')
    print(f'[i] Is simulate: {isSimulate}')
    print(f'[i] Current date time: {currentDateTime}')
    print(f'================================================================================')

def getStringFormat(fileGetctime):
    fileCtime = time.ctime(fileGetctime)
    fileStrptime = time.strptime(fileCtime)
    fileStrftime = time.strftime("%Y-%m-%d %H:%M:%S", fileStrptime)
    return fileStrftime

def getDateTime(fileGetctime):
    return datetime.datetime.fromtimestamp(fileGetctime)

def clear(dir: str):
    if (os.path.exists(dir) == False):
        print(f'[!] Can not find directory: "{dir}"!')
    else:
        for file in os.listdir(dir):
            absolutePath = f'{dir}/{file}'
            if (os.path.isdir(absolutePath)):
                clear(absolutePath)
            if (os.path.isfile(absolutePath)):
                fileGetctime = os.path.getctime(absolutePath)
                if (currentTime - fileGetctime) / (24 * 3600) >= diffDays:
                    if (isSimulate == True):
                        print(f'[i] Find file: "{absolutePath}" Creation time: "{getStringFormat(fileGetctime)}"')
                    else:
                        print(f'[i] Remove file: "{absolutePath}" Creation time: "{getStringFormat(fileGetctime)}"')
                        os.remove(absolutePath)

def main():
    global dir
    global diffDays
    print(f'--- Clear files ---')
    clear(dir)
    print(f'================================================================================')

printTitle()
setup()
printInfo()
main()
