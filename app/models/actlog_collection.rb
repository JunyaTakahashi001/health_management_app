class ActlogCollection
    include ActiveModel::Conversion
    extend ActiveModel::Naming
    extend ActiveModel::Translation
    include ActiveModel::AttributeMethods
    include ActiveModel::Validations
    ACTLOG_NUM = 10  # 同時に作成する数
    attr_accessor :collection  # ここに作成したユーザーモデルが格納される
  
    # 初期化メソッド
    def initialize(attributes = [])
      if attributes.present?
        self.collection = attributes.map do |value|
          Actlog.new(
            date: value['date'],
            renge: value['renge'],
            start_time: value['start_time'],
            end_time: value['end_time'],
            destination: value['destination'],
            transportation: value['transportation'],
            departure: value['departure'],
            arrival: value['arrival'],
            attendees: value['attendees'],
            attendees_details: value['attendees_details'],
            other: value['other'],
            user_id: value['user_id'],
            health_id: value['health_id']
          )
        end
      else
        self.collection = ACTLOG_NUM.times.map{ Actlog.new }
      end
    end
  
    # レコードが存在するか確認するメソッド
    def persisted?
      false
    end

    # コレクションをDBに保存するメソッド
  def save
    is_success = true
    ActiveRecord::Base.transaction do
      collection.each do |result|
        # バリデーションを全てかけたいからsave!ではなくsaveを使用
        is_success = false unless result.save
      end
      # バリデーションエラーがあった時は例外を発生させてロールバックさせる
      raise ActiveRecord::RecordInvalid unless is_success
    end
    rescue
      p 'エラー'
    ensure
      return is_success
  end
end