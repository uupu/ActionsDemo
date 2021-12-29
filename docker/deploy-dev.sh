#! bin/bash
# 外部传给内部的变量脚本

app_name="actions"
port="1000"
tag="dev-deploy"
aliyun_image_registry="registry.cn-shanghai.aliyuncs.com/offline-terry"

echo "对容器存活进行判断"
if test -n "$(docker ps -a |grep $app_name)" ; then
  echo "停止并且删除容器"
  docker stop $app_name-$tag
  docker rm $app_name-$tag
  docker rmi $aliyun_image_registry/$app_name:$tag
else
  echo "未检查到$app_name容器运行"
fi

echo "获取最新的镜像"
docker pull $aliyun_image_registry/$app_name:$tag
echo "启动服务"
# 有需要添加的环境变量随时添加
docker run -itd\
 -e TZ="Asia/Shanghai"\
 -e SERVER_PORT=$port\
 -p $port:$port\
 --name $app_name-$tag  $aliyun_image_registry/$app_name:$tag
