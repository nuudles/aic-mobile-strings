#!/bin/bash

if (( $# != 1 ))
then
	echo "Usage: ./convert_ios.sh [path_to_ios_localization_folder]"
	exit 1
fi

twineFiles=("access_card.twine" "audio.twine" "base.twine" "info.twine" "localization.twine" "localization_ui.twine" "location_ui.twine" "map.twine" "media_ui.twine" "search.twine")
stringsFiles=("AccessCard.strings" "Audio.strings" "Base.strings" "Info.strings" "Localization.strings" "LocalizationUI.strings" "LocationUI.strings" "Map.strings" "MediaUI.strings" "Search.strings")

for ((i=0;i<${#twineFiles[@]};++i)); do
	twineFile=${twineFiles[i]}
	stringsFile=${stringsFiles[i]}

	twine generate-localization-file --lang en $twineFile $1/en.lproj/$stringsFile
	twine generate-localization-file --lang es $twineFile $1/es.lproj/$stringsFile
	twine generate-localization-file --lang zh $twineFile $1/zh-Hans.lproj/$stringsFile
	twine generate-localization-file --lang ko $twineFile $1/ko.lproj/$stringsFile
	twine generate-localization-file --lang fr $twineFile $1/fr.lproj/$stringsFile

	echo $twineFile converted
done
