require 'spec_helper'

describe Piggybak::Order do

  it { should belong_to :user }
  it { should belong_to(:billing_address).class_name("Piggybak::Address") }
  it { should belong_to(:shipping_address).class_name("Piggybak::Address") }

  it { should validate_presence_of :email }
  it { should validate_presence_of :phone }
#  it { should validate_presence_of :status }
#  it { should validate_presence_of :total }
#  it { should validate_presence_of :total_due }
#  it { should validate_presence_of :tax_charge }
#  it { should validate_presence_of :created_at }

  it "should be a dumb test to show usage" do
    @order = Factory(:order)
  end

  it "should initialize correctly" do
    @order = Piggybak::Order.new
    assert_not_nil @order.billing_address
    assert_not_nil @order.shipping_address
    assert_not_nil @order.shipments
    assert_not_nil @order.payments
  end

  it "should set defaults" do
    @order = Factory.build(:order)
    @order.valid?
    assert_equal @order.created_at, Time.now
    assert_equal @order.status, "new"
    assert_equal @order.total, 0
    assert_equal @order.total_due, 0
    assert_equal @order.tax_charge, 0
  end
end
