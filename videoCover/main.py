from picCover import Pic
from video2Pic import Video
import os

if __name__ == "__main__":
    os.chdir(r'F:\xixi\videoCover\videos\Time Lapse Video Of Clouds')

    video = Video('F:\\xixi\\videoCover\\videos', 'F:\\xixi\\videoCover\\videos', 1)
    video.video_pic()

    file_li = os.listdir()
    pic_li = [_ for _ in file_li if _.endswith('jpg')]
    for pict in pic_li:
        file_path = './xixi/generate_' + pict
        pic = Pic(pict, file_path)
        pic.convert_sketch()