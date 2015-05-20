var Piece = React.createClass({

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
      <div>
        <h2><a target="_blank" href={this.props.url}>{this.props.name}</a></h2>
        <p className="title">{this.state.title}</p>
        <p className="composer">{this.state.composer}</p>
      </div>
    );
  }
});

var AllPieces = React.createClass({
  render: function() {
    return (
      <div>
        <Piece source="/counterstream" name="Counterstream Radio" url="http://counterstreamradio.net/" />
        <Piece source="/earwaves" name="Earwaves" url="http://somafm.com/earwaves/" />
        <Piece source="/q2" name="Q2 Music" url="http://q2music.org/" />
        <Piece source="/second-inversion" name="Second Inversion" url="http://secondinversion.org/" />
        <Piece source="/yle" name="Yle Klassinen" url="http://yle.fi/aihe/klassinen" />
      </div>
    );
  }
})

React.render(<AllPieces />, document.getElementById("pieces"));
