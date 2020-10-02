# Mobility visualisations for Wales / Delweddau symudedd i Gymru

## English

This repository contains code for processing and visualising mobility data from [Apple](https://covid19.apple.com/mobility), [Facebook](https://data.humdata.org/dataset/movement-range-maps) and [Google](https://www.google.com/covid19/mobility/).

### Files
*	prepare_data_national.r - reads and wrangles the Google, Apple, and Facebook datasets for the main mobility viz report
* prepare_data_la.r - reads and wrangles the Google dataset for the Welsh local authority report
*	mobility_viz_report_E.rmd - a markdown report for plotting national data (English)
* mobility_viz_report_W.rmd - a markdown report for plotting national data (Welsh)
* local_authority_report_E.rmd - a markdown report for plotting Welsh local authority mobility data from Google (English)
* local_authority_report_W.rmd - a markdown report for plotting Welsh local authority mobility data from Google (Welsh)

### Reporting workflow
To generate the reports:
1.	Pull the latest version of the repository to your computer (or clone if you haven't already)
2.	Download the latest Google, Facebook, and Apple datasets and store them on your computer
3.	Open run_report.R in RStudio and change the default file paths. **Note:** run_report.r uses `Sys.setlocale()` to change the language setting to Welsh for the Welsh reports. The last line of code in run_report.r will then set the language to English. 
4.	Run the run_report.R file (but don't save it)
5.	Add all changes to the repository and push back to GitHub

## Cymraeg

Mae'r ystorfa hon yn cynnwys cod ar gyfer prosesu a delweddu data symudedd o [Apple](https://covid19.apple.com/mobility), [Facebook](https://data.humdata.org/dataset/movement-range-maps) a [Google](https://www.google.com/covid19/mobility/).

### Ffeiliau

*	prepare_data_national.r - darllen a phrosesu setiau data Google, Apple a Facebook ar gyfer y prif adroddiad delweddu symudedd
* prepare_data_la.r - darllen a phrosesu set ddata Google ar gyfer adroddiad awdurdod lleol Cymru
*	mobility_viz_report_E.rmd - adroddiad markdown ar gyfer plotio data cenedlaethol (Saesneg)
* mobility_viz_report_W.rmd - adroddiad markdown ar gyfer plotio data cenedlaethol (Cymraeg)
* local_authority_report_E.rmd - adroddiad markdown ar gyfer plotio data symudedd awdurdodau lleol Cymru o Google (Saesneg)
* local_authority_report_W.rmd - adroddiad markdown ar gyfer plotio data symudedd awdurdodau lleol Cymru o Google (Cymraeg)

### Y broses adrodd
Cynhyrchu'r adroddiadau:
1.	Tynnwch y fersiwn ddiweddaraf o'r ystorfa i'r cyfrifiadur (neu clonio os nad ydych eisoes)
2.	Lawrlwythwch setiau data diweddaraf Google, Facebook ac Apple a'u storio ar y cyfrifiadur
3.	Agorwch run_report.r mewn RStudio a newidwch y llwybrau ffeil ddiofyn. **Nodyn:** Mae run_report.r yn defnyddio `Sys.setlocale()` i newid y gosodiadau iaith i'r Gymraeg ar gyfer yr yr adroddiadau Cymraeg. Mae llinell olaf y cod yn newid y iaith i Saesneg. 
4.	Rhedeg y ffeil run_report.r (ond peidiwch â'i chadw)
5.	Ychwanegwch yr holl newidiadau i'r ystorfa a gwthio'n ôl i GitHub
