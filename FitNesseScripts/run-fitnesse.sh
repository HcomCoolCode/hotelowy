#!/bin/bash

FITNESSE_PORT=8089
BUILDNOCLEAN=0
BUILD=0
SCRIPT_DIR=$(dirname $0)
CLEAN=0

while [ "$1" != "" ]; do
    case $1 in
	
        -bnc | --buildnoclean )	shift
                                BUILDNOCLEAN=1
                                ;;

		-p | --port )			shift
								FITNESSE_PORT=$1
                                ;;

		-b | --build )			shift
								BUILD=1
    							;;

        -c | --clean )			shift
                                CLEAN=1
                                ;;

		esac
		shift
done

cd ${SCRIPT_DIR}

function fitnesse_start {
	echo "Starting Fitnesse"
	java -Xmx100M -jar fitnesse-standalone.jar -e 0 -p ${FITNESSE_PORT} &
}

function fitnesse_wait {
	CURL_CONNECION_REFUSED_CODE=7
	CURL_RESULT=$CURL_CONNECION_REFUSED_CODE
	while [ $CURL_RESULT -eq $CURL_CONNECION_REFUSED_CODE ] 
	do
		sleep 0.5
		echo -n "."
		curl -s "http://localhost:${FITNESSE_PORT}" > /dev/null 2>&1 
		CURL_RESULT=$?
	done
	echo ""
}

function fitnesse_clean {
    rm -rf ~/Library/Developer/Xcode/Derivedata/
}

function fitnesse_open {
	open "http://localhost:${FITNESSE_PORT}/CeDevices"
}

# clean Project
echo "before clean"
if [ "$CLEAN" -eq 1 ]; then
    echo "Cleaning..."
    fitnesse_clean
fi

# Build and Install Project
if [ "$BUILD" -eq 1 ]; then
	echo "Building..."
	bin/RunSlimTestsBuild
	BUILD_EXIT_CODE=$?
	if [ "$BUILD_EXIT_CODE" -ne 0 ]; then
		exit 1
	fi
fi

# Build and Install Project Without Cleaning
if [ "$BUILDNOCLEAN" -eq 1 ]; then
echo "Building without cleaning..."
bin/RunSlimTestsBuildNoClean
BUILD_EXIT_CODE=$?
if [ "$BUILD_EXIT_CODE" -ne 0 ]; then
exit 1
fi
fi


# Enable Job Control
set -o monitor

# Start Fitnesse
fitnesse_start

# Wait for Fitnesse
fitnesse_wait

# Open Fitnesse
fitnesse_open

# Hand Foreground back to Fitnesse
fg %1


