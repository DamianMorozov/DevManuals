# Stable Diffusion resources

- [Diffusion Toolkit](https://github.com/RupertAvery/DiffusionToolkit)
- [Lexica.art](https://lexica.art/)
- [Install Stable Diffusion Locally)](https://www.youtube.com/watch?v=6MeJKnbv1ts)
- [Stable Diffusion WebUI](https://github.com/AUTOMATIC1111/stable-diffusion-webui)
- [Hugging Face](https://huggingface.co/)
- [Hugging Face Stable Diffusion v1-4](https://huggingface.co/CompVis/stable-diffusion-v-1-4-original)
- [GFPGAN Face Restoration Link](https://github.com/TencentARC/GFPGAN)
- [Stable Diffusion Official](https://beta.dreamstudio.ai/dream)
- [Stable Diffusion ART](https://stable-diffusion-art.com/)
- [Beginner’s guide to Stable Diffusion AI image](https://stable-diffusion-art.com/beginners-guide/)
- [Stable Diffusion Workflow](https://stable-diffusion-art.com/workflow/)
- [Tips for good prompts](https://stable-diffusion-art.com/how-to-come-up-with-good-prompts-for-ai-image-generation/)
- [Generative AI Library](https://library.phygital.plus/)
- [DrawAnyOne.ai](https://drawanyone.ai/)
- [Learn Prompting](https://learnprompting.org/)

## Code Edit for less powerful computers
```
--opt-split-attention --precision full --no-half --medvram
```

## Linux usage
`
cd ../stable-diffusion-webui
`

## Extensions for webui
- [Rembg - Removes backgrounds from pictures](https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg)

## Error
- [Cannot activate python venv, aborting](https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues/1120)
should not return any errors: `python3 -c 'import venv'`
should populate the directory: `python3 -m venv venv/`
run: `bash ./webui-user.sh` or `bash ./webui.sh`
To create a public link, set `share=True` in `launch()`: `bash ./webui.sh --share`

## Error
- [RuntimeError: Cannot add middleware after an application has started](https://github.com/AUTOMATIC1111/stable-diffusion-webui/discussions/7749)
```
python3 -m pip install --upgrade pip
pip uninstall fastapi
pip install fastapi==0.90.1
```
