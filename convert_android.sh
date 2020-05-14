#!/bin/bash

if (( $# != 1 ))
then
	echo "Usage: ./convert_ios.sh [path_to_android_folder]"
	exit 1
fi

twineFiles=("access_card.twine" "audio.twine" "base.twine" "info.twine" "localization.twine" "localization_ui.twine" "location_ui.twine" "map.twine" "media_ui.twine" "search.twine")

for twineFile in "${twineFiles[@]}"; do
	name=$(basename $twineFile .twine)

	twine generate-localization-file --format android --lang en $twineFile $1/$name/src/main/res/values-en/strings.xml
	twine generate-localization-file --format android --lang es $twineFile $1/$name/src/main/res/values-es/strings.xml
	twine generate-localization-file --format android --lang zh $twineFile $1/$name/src/main/res/values-zh/strings.xml
	twine generate-localization-file --format android --lang ko $twineFile $1/$name/src/main/res/values-ko/strings.xml
	twine generate-localization-file --format android --lang fr $twineFile $1/$name/src/main/res/values-fr/strings.xml

	echo $twineFile converted
done
