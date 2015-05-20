var Piece = React.createClass({displayName: "Piece",

  getInitialState: function() {
    return {
      title: "", 
      composer: ""
    }
  },

  componentDidMount: function() {
    this.loadData();
    setInterval(this.loadData, 60 * 1000);
  },

  loadData: function() {
    $.get(this.props.source, function(result) {
      this.setState({
        title: result.title,
        composer: result.composer
      });
    }.bind(this));
  },

  render: function() {
    return (
      React.createElement("div", null, 
        React.createElement("h2", null, React.createElement("a", {target: "_blank", href: this.props.url}, this.props.name)), 
        React.createElement("p", {className: "title"}, this.state.title), 
        React.createElement("p", {className: "composer"}, this.state.composer)
      )
    );
  }
});

React.render(React.createElement(Piece, {source: "/counterstream", name: "Counterstream Radio", url: "http://counterstreamradio.net/"}), 
             document.getElementById('counterstream'));