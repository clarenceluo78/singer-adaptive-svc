import random
import os
import json
from collections import defaultdict
import sys

sys.path.append("../")
from config import data_path, dataset2path, dataset2wavpath

def prosinger_statistics():
    pass


if __name__ == "__main__":
    # Load
    prosinger_dir = dataset2wavpath["ProSinger"]

    # select first 50 wav files as train set, the next 10 as test set
    train = []
    test = []
    for singer in os.listdir(prosinger_dir):
        segments_dir = os.path.join(prosinger_dir, singer)
        for wav in os.listdir(segments_dir):
            song_id = wav.split("_")[0]
            uid = wav.split(".")[0]
            res = {"Singer": singer, "Song": song_id, "Uid": uid}
            res["Path"] = "{}/{}".format(singer, wav)

            if int(song_id) < 50:
                train.append(res)
            elif int(song_id) < 60:
                test.append(res)

    # Save
    save_dir = os.path.join(data_path, "ProSinger")
    os.makedirs(save_dir, exist_ok=True)
    with open(os.path.join(save_dir, "train.json"), "w") as f:
        json.dump(train, f, indent=4, ensure_ascii=False)
    with open(os.path.join(save_dir, "test.json"), "w") as f:
        json.dump(test, f, indent=4, ensure_ascii=False)