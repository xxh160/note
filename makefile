CUR_TIME:=$(date +"%Y-%m-%d_%H:%M:%S")

upload:
	@git add .
	@git push origin main
	@git commit -m "a$(CUR_TIME)"

maintain:
	@git fetch origin main:tmp
	@git merge tmp
	@git branch -d tmp