ssh-add

ssh tbottini@ceres.huma-num.fr "rm -rf /tmp/antonomaz-iiif/ && mkdir /tmp/antonomaz-iiif/"
scp ./out_tiff/* tbottini@ceres.huma-num.fr:/tmp/antonomaz-iiif/
ssh tbottini@ceres.huma-num.fr "sudo -S mv /tmp/antonomaz-iiif/* /data/iiif/antonomaz && rm -rf /tmp/antonomaz-iiif/"