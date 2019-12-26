import os
import cv2


class Video():

    def __init__(self, input_path, output_path, interval=30, video_type='.mp4'):
        self.input_path = input_path
        self.output_path = output_path
        self.video_type = video_type
        self.interval = interval

    def video_pic(self):
        # 读取以videos_type结尾的视频文件列表
        videos = os.listdir(self.input_path)
        videos = filter(lambda x: x.endswith(self.video_type), videos)

        print('running please wait...(程序正在提取视频帧，请稍等...)')

        # 读取每个视频
        for each_video in videos:
            print('正在处理视频: ' + each_video)

            # 获得每个视频名称并创建文件夹（用来保存截图）
            each_video_name, _ = each_video.split('.')
            os.mkdir(self.output_path + '\\' + each_video_name)
            each_frames_save_full_path = os.path.join(self.output_path, each_video_name) + '\\'

            # 使用每个视频名称获取视频来源路径，打开视频并提取截图
            each_video_full_path = os.path.join(self.input_path, each_video)

            cap = cv2.VideoCapture(each_video_full_path)
            frame_count = 1
            snap_count = 0
            success = True
            while (success):
                success, frame = cap.read()
                # 使用print除错
                # print('--->正在读取第%d帧'%frame_count,success)

                # 按帧数间隔读取帧保存
                if int(self.interval) == 1:
                    cv2.imwrite(each_frames_save_full_path + each_video_name + '_%d.jpg' % frame_count, frame)
                    snap_count += 1
                elif frame_count % int(self.interval) == 1:
                    cv2.imwrite(each_frames_save_full_path + each_video_name + '_%d.jpg' % frame_count, frame)
                    snap_count += 1
                frame_count += 1

if __name__ == "__main__":
    video = Video('F:\\xixi\\videoCover\\videos', 'F:\\xixi\\videoCover\\videos')
    video.video_pic()