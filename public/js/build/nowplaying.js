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

var AllPieces = React.createClass({displayName: "AllPieces",
  render: function() {
    return (
      React.createElement("div", null, 
        React.createElement(Piece, {source: "/counterstream", name: "Counterstream Radio", url: "http://counterstreamradio.net/"}), 
        React.createElement(Piece, {source: "/dronezone", name: "Dronze Zone", url: "http://somafm.com/dronezone/"}), 
        React.createElement(Piece, {source: "/earwaves", name: "Earwaves", url: "http://somafm.com/earwaves/"}), 
        React.createElement(Piece, {source: "/q2", name: "Q2 Music", url: "http://q2music.org/"}), 
        React.createElement(Piece, {source: "/second-inversion", name: "Second Inversion", url: "http://secondinversion.org/"}), 
        React.createElement(Piece, {source: "/yle", name: "Yle Klassinen", url: "http://yle.fi/aihe/klassinen"})
      )
    );
  }
})

React.render(React.createElement(AllPieces, null), document.getElementById("pieces"));
