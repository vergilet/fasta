module Fasta
  class RoutesMapper
    def initialize(action, router)
      @action = action
      @router = router
    end

    def reg(method, route, action_name)
      router.public_send(method, route, to: action.call(action_name))
    end

    private

    attr_reader :action, :router
  end
end
