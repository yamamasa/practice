# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(account)
    account.account_roles.joins(:role, :shop).find_each do |account_role|
      method_name = '%s_ability' % [account_role.role.code]

      send(method_name, account, account_role) if respond_to?(method_name)
    end
  end

  # 全員に対するもの
  def all_ability(_account, _account_role)
    can :read, Category
    can :read, Role
  end

  # システム管理者
  def admin_ability(account, account_role)
    all_ability(account, account_role)

    can :read, Shop, id: account_role.shop.self_and_siblings.ids
    can :read, Account, id: account.id
  end

  # 店舗管理者
  def manager_ability(account, account_role)
    operator_ability(account, account_role)

    # TODO
  end

  # 店舗スタッフ
  def operator_ability(account, account_role)
    all_ability(account, account_role)
    # TODO
  end
end
