class GraphNode
    attr_reader :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

    def neighbors=(arr)
        @neighbors = arr
    end
end

def bfs(start_node, target)
    visited = []
    queue = [start_node]
    until queue.empty?
        node = queue.shift
        visited << node
        if node.value == target
            return node
        elsif !node.neighbors.empty?
            node.neighbors.each {|neighbor| queue << neighbor if !visited.include?(target)}
        else
            return nil
        end
    end
end
a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p  bfs(a, "f")