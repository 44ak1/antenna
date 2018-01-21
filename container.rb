require 'fog'

CONOHA_TENANT_NAME = ('gnct80282417') #テナント名
CONOHA_USERNAME = ('gncu80282417') #ユーザー名
CONOHA_API_PASSWORD = ('Conoha55622637') #自分で決めたAPIパスワード
CONOHA_API_AUTH_URL = ('https://identity.tyo1.conoha.io/v2.0') #Identity Service
CONOHA_CONTAINER_NAME = ('mob') #これは、OBS内にこれから、作るコンテナの名前。今回の例ならば"http://object-s.../public/.."というディレクトリ名にあたる。

strage = Fog::Storage.new(
  provider: 'OpenStack', #conohaはopenstackベースなのでopenstack API形式で動かします。
  openstack_tenant: CONOHA_TENANT_NAME,
  openstack_username: CONOHA_USERNAME,
  openstack_api_key: CONOHA_API_PASSWORD,
  openstack_auth_url: CONOHA_API_AUTH_URL + '/tokens',
)

strage.put_container(CONOHA_CONTAINER_NAME,
  public: true, headers: { 'X-Web-Mode' => 'true' })

